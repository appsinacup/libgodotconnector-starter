defmodule StarterAppTest do
  use ExUnit.Case

  describe "without Godot running" do
    test "hello function handles missing Godot gracefully" do
      # When Godot is not running, should return an error
      assert StarterApp.hello() == {:error, :not_running}
    end
  end

  describe "module exists" do
    test "StarterApp module is loaded" do
      assert Code.ensure_loaded?(StarterApp)
    end

    test "StarterApp.Application module is loaded" do
      assert Code.ensure_loaded?(StarterApp.Application)
    end
  end
end
