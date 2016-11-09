-module(todo_handler).
-compile([parse_transform, leptus_pt]).


%% leptus callbacks
-export([init/3]).
-export([cross_domains/3]).
-export([terminate/4]).

%%Leptus Routes
-export([get/3]).
-export([post/3]).
-export([put/3]).
-export([delete/3]).

-include("todo_record.hrl").
-include_lib("stdlib/include/qlc.hrl").


%% allow any host for x-domain requests HALLEFRICKINLUJAH
cross_domains(_Route, _Req, State)  ->
	{['_'], State}.
	
%% get this going
init(_Route, _Req, State) ->
	{ok, State}.
	
%%
get("/test", _Req, State) ->
	ok.
	
get("/:name", _Req, State) ->
	Id = leptus_req:param(Req, name),
	ok.
	
	
terminate (_Reason, _Route, _Req, _State) -> 
	ok.
	


