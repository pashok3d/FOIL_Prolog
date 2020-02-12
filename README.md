# FOIL Prolog
 First Order Inductive Learner ([FOIL](https://en.wikipedia.org/wiki/First-order_inductive_learner)) algorithm implemented in Prolog.
# About 
  The general approach used in an inductive learner is to start from the predicate whose definition is to be learned as the head of a a     rule whose body is initialized to be empty. At each step, we add a literal to the body of the rule so that it satisfies several positive   examples and none of negative examples. The literal to be added can be one of the predicates from the problem statement, the negation of   a predicate from the problem statement, equality between two bound variables and inequality between two bound variables. For choosing     between alternative literals, a heuristic measure is used.
  [Here](https://github.com/johntrimble/foil-python#what-is-foil) is a good example to illustrate FOIL algorithm.
# How to run
 1. Clone repository
 2. Run Prolog IDE (recommended IDE - [SWI-Prolog](https://www.swi-prolog.org/))
 3. Change IDE working directory to the cloned repository directory ``` working_directory(_,'REPOSITORY_DIRECTORY'). ```
 4. Define files to compile ``` [loadall]. ```
 5. Compile ``` load(). ```
 6. Use ``` learn ``` function to learn rules. For example ``` learn(grandfather, Rule). ```
 
 Note: To learn new rules, corresponding predicates must be added, as well as necessary facts. See "fakty_1" file for an example.
