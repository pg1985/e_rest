-module(todo_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("todo_record.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->

    Opts = [{static_dir, { '_', { priv_dir, ?MODULE, "templates"}}}],
    leptus:start_listener(http, [{'_', [{todo_handler, undef}]}], Opts).

start(_StartType, _StartArgs, Other) ->
	Opts = [{static_dir, { '_', { priv_dir, ?MODULE, "templates"}}}],
    leptus:start_listener(http, [{'_', [{todo_handler, undef}]}], Opts).


stop(_State) ->
    ok.
