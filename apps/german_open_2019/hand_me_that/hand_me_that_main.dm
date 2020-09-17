% Main dialogue model for the Take out the garbage test of the RoboCup@Home 
% Competition, Rulebook 2019
%
% Copyright (C) 2019 UNAM (Universidad Nacional Autónoma de México)
% Ivan Torres (ivantr18@hotmail.com)
% 
%	roscore
%	rosserial
%	torso
%	rosaria
%	golem_navigation_wo_follow
%	rviz
%	En windows : WinASR
%	
%%
diag_mod(hand_me_that_main,
[
    %%Initial situation
    %Detect door
    [  
       id ==> is,
       type ==> recursive,
       %embedded_dm ==> detect_door(_),
       embedded_dm ==> say('detect door',_),
       arcs ==> [
                success : empty => go_to_ini,
                error   : [say('Open the door please')] => is				
                ]
    ],
    %%Moving to information_point
    [
	id ==> go_to_ini,	
	type ==> recursive,
	%embedded_dm ==> move(get(waiting_position,_),Status),
	embedded_dm ==> say(['Moving to',get(waiting_position,_)],Status),
	arcs ==> [
		success : [say('Hello, what do you need'),sleep,sleep] => get_pointing_item,
		error : [say('Sorry I cannot reach the initial point')] =>go_to_ini
	]
    ],
    %listening for location
    [
	 id ==> get_pointing_item,
	 type ==> listening(location),
	 arcs ==> [
	                said(X): [say(['Do you want to know where is the ',X])] => confirm(X),
	                said(nothing): [say('Sorry I did not hear you')] => get_pointing_item
		  ]
    ],
    [
	 id ==> confirm(X),
	 type ==> listening(yesno),
	 arcs ==> [
	                said(yes): [say('Perfect')] => explain_place(X),
	                said(no): [say('Please ask me again')] => get_location,
	                said(nothing): empty => confirm(X)
		  ]
    ],
    %%Explain a place
    [
	id ==> explain_place(X),	
	type ==> recursive,
	embedded_dm ==> give_directions(X,Status),
	arcs ==> [
		success : empty => go_to_inf,
		error : [say('Sorry I cannot give you the directions')] =>explain_place(X)
	]
    ],
    

    %final situation
    [
	id ==> fs,
	type ==> final
    ]
  ],
  
  [
  	waiting_position ==> initial_handme
  ]
).	

