-modlue(todo_app).
-behavoiur(application).


-export([start/2, stop/1]).

-include("todo_record.hrl").

start(_StartType, _StartArgs) ->

	%% Start mnesia database in current node
    %% which is nonode@nohost
	mnesia:create_schema([node()]),
	mnesia:start(),
	
	%% Create mnesia table based on todo record
    %% which is defined in src/todo_records.hrl
	mnesia:create_table(todo, [
		{attributes, record_info(fields, todo)},
		{disc_copies, [node()]} %% disc_copies means persistent
	]),
	
	%%This defines a static directory
	Opts = [{static_dir, {'_', {priv_dir, ?MODULE, "templates"}}}],
	
	%%this routes incoming requests to the todo_handler
	laptus:start_listener(http, [{'_', [{todo_handler, undef}]}], Opts).
	
Stop(_State) ->
	ok.
