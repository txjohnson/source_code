# Deliberative inference demo
The code that implements the deliberative inference demo, involving abduction, decision-making and planning, is within the files:

- [demo_supermarket_main.dm](https://github.com/SitLog/source_code/blob/master/apps/german_open_2019/demo_supermarket/demo_supermarket_main.dm): the initial and final interactions between the human and the robot are defined here, as well as the dispatcher for the actions in the task and the error manager is called in case something goes wrong.
- [action_reasoner.pl](https://github.com/SitLog/source_code/blob/master/apps/german_open_2019/demo_supermarket/action_reasoner.pl): the code in this file examines the actions or behaviors to be carried out given the obligations in the task.
- [error_manager_demo.dm](https://github.com/SitLog/source_code/blob/master/apps/german_open_2019/demo_supermarket/error_manager_demo.dm): when an error arises this code is called to make a case analysis on the possible errors and make a recovery accordingly. Here the *daily life inference* cycle is considered when the robot attempts to take an object that is not found in the current shelf.
- [user_functions.pl](https://github.com/SitLog/source_code/blob/master/apps/test_behaviors/user_functions.pl): several user functions needed in the deliberative inference demo are defined here among many others for a wide range of dialogue models. Some of the user functions used by the deliberative inference demo are: the supermarket conversation parser, the call of the search space algorithms and the update of the KB.
- [ricardo_supermarket_kb.txt](https://github.com/SitLog/source_code/blob/master/knowledge_base/ricardo_supermarket_kb.txt): holds the KB for the deliberative inference demo.
- The code that implements the search space algorithms to determine the diagnosis, decision-making and planning is found in the files: [daily_life_inference_cycle_2020.pl](https://github.com/SitLog/source_code/blob/master/knowledge_base/daily_life_inference_cycle_2020.pl), [diagnosis_2020.pl](https://github.com/SitLog/source_code/blob/master/knowledge_base/diagnosis_2020.pl), [decision_maker_2020.pl](https://github.com/SitLog/source_code/blob/master/knowledge_base/decision_maker_2020.pl), [planner_2020.pl](https://github.com/SitLog/source_code/blob/master/knowledge_base/planner_2020.pl) and [
new_observation_2020.pl](https://github.com/SitLog/source_code/blob/master/knowledge_base/new_observation_2020.pl).

If the demo wants to be executed on SitLog test mode, run the command ```./scripts/german_open_2019 test``` on a terminal with present directory the root of this repository (see also the instructions [here](https://github.com/SitLog/source_code#sitlog)). Then you can enter the following answers when prompted by the interpreter.

    res(demo_supermarket).
    ok.
    'bring me a coke please'.
    'no'.
    objects([object(noodles,0.2,2,0.55,4,5,6,7,8),object(malz,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(noodles,0.2,2,0.55,4,5,6,7,8),object(malz,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(noodles,0.2,2,0.55,4,5,6,7,8),object(malz,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(kellogs,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(kellogs,0.2,2,0.55,4,5,6,7,8),object(noodles,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(coke,0.2,2,0.55,4,5,6,7,8)]).
    objects([object(coke,0.2,2,0.55,4,5,6,7,8)]).

