defmodule HyveDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HyveDemoWeb.Telemetry,
      HyveDemo.Repo,
      {DNSCluster, query: Application.get_env(:hyve_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: HyveDemo.PubSub},
      # Start a worker by calling: HyveDemo.Worker.start_link(arg)
      # {HyveDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      HyveDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HyveDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HyveDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
