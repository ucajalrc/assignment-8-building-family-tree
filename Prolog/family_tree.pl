/* ----------------------------------------------------------
   family_tree.pl
   A small family tree with facts + rules for:
   - parent/2, male/1, female/1
   - child/2, father/2, mother/2
   - sibling/2 (+ brother/2, sister/2)
   - grandparent/2, grandchild/2
   - cousin/2
   - ancestor/2, descendant/2 (recursive)
   - convenience predicates for pretty queries (children/2, siblings_of/2, descendants/2)
   ---------------------------------------------------------- */

% --------
% Basic facts (edit/extend these freely for your assignment)
% parent(Parent, Child).
% male(Person). / female(Person).
% --------

% Grandparent generation
male(john).
female(susan).

% Their children
female(alice).
male(bob).

% Alice's spouse + children
male(carl).
female(diana).
male(ethan).

% Bob's spouse + children
female(fiona).
male(george).
female(helen).

% Parent relationships
parent(john,  alice).
parent(susan, alice).
parent(john,  bob).
parent(susan, bob).

parent(alice, diana).
parent(carl,  diana).
parent(alice, ethan).
parent(carl,  ethan).

parent(bob,   george).
parent(fiona, george).
parent(bob,   helen).
parent(fiona, helen).

% (Optional) we can record “spouses” if desired (not needed for required rules):
spouse(john, susan).
spouse(susan, john).
spouse(alice, carl).
spouse(carl,  alice).
spouse(bob,   fiona).
spouse(fiona, bob).

% --------
% Derived relationships (rules)
% --------

% child(C, P): C is a child of P (inverse of parent/2)
child(C, P) :- parent(P, C).

% father/mother (uses gender + parent)
father(F, C) :- male(F), parent(F, C).
mother(M, C) :- female(M), parent(M, C).

% sibling(X, Y): share at least one parent and are different persons
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% brother/sister as gendered siblings
brother(B, X) :- male(B), sibling(B, X).
sister(S, X)  :- female(S), sibling(S, X).

% grandparent(G, C): G is parent of a parent of C
grandparent(G, C) :-
    parent(G, P),
    parent(P, C).

% grandchild(GC, GP): inverse of grandparent
grandchild(GC, GP) :-
    grandparent(GP, GC).

% cousin(X, Y): parents (P1, P2) are siblings; X and Y are different people
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% --------
% Recursive relationships (transitive)
% --------

% ancestor(A, D): A is an ancestor (parent^+) of D.
ancestor(A, D) :- parent(A, D).
ancestor(A, D) :-
    parent(A, X),
    ancestor(X, D).

% descendant(D, A): inverse of ancestor
descendant(D, A) :- ancestor(A, D).

% --------
% Convenience (helper) predicates for “nice” list outputs
% These make it easy to see results in one shot with a single query.
% --------

% children(Person, ChildrenList)
children(P, Cs) :-
    findall(C, child(C, P), Raw),
    sort(Raw, Cs).

% siblings_of(Person, SiblingsList)
siblings_of(P, Ss) :-
    findall(S, sibling(P, S), Raw),
    sort(Raw, Ss).

% cousins_of(Person, CousinsList)
cousins_of(P, Cs) :-
    findall(C, cousin(P, C), Raw),
    sort(Raw, Cs).

% descendants(Person, DescList) - all descendants at any depth (recursive)
descendants(P, Ds) :-
    findall(D, descendant(D, P), Raw),
    sort(Raw, Ds).

% grandparents_of(Person, Gps)
grandparents_of(P, Gps) :-
    findall(G, grandparent(G, P), Raw),
    sort(Raw, Gps).

/* ----------------------------------------------------------
   END OF FILE
   ---------------------------------------------------------- */

