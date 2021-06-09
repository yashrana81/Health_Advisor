helpme:-
hypothesis(Disease),
undo.

hypothesis(cold) :- cold, !.
hypothesis(covid19) :- covid19, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(malaria) :- malaria, !.
hypothesis(unknown).


covid19 :-
verify(fever),
verify(cough),
verify(sore_throat),
verify(shortness_of_breath),
verify(loss_of_smell_or_taste),
write('The symptoms indicate that the patient might have COVID19 '),
nl,
write('Advices and Sugestions:'),
nl,
write('1: Quarantine youself for at least 14 days'),
nl,
write('2: Avoid any direct conatct with anyone'),
nl,
write('3: Follow a healthy diet plan'),
nl,
write('4: Keep a record of your SpO2 levels and temp.'),
nl,
write('5: Consult a doctor for prescription'),
nl.

cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('The symptoms indicate that the patient might have COLD '),
nl,
write('Advices and Sugestions:'),
nl,
write('1: Avoid cold food and beverages'),
nl,
write('2: Avoid dust and pollutants'),
nl,
write('3: Follow a healthy diet plan'),
nl,
write('4 :Wear warmer clothes'),
nl.

flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache),
write('The symptoms indicate that the patient might have FLU '),
nl,
write('Advices and Sugestions:'),
nl,
write('1: Avoid direct conatct with anyone'),
nl,
write('2: Cover your nose and mouth'),
nl,
write('3: Eat healthy food'),
nl,
write('4: Take proper rest'),
nl.

typhoid :-
verify(headache),
verify(abdominal_pain),
verify(poor_appetite),
verify(fever),
write('The symptoms indicate that the patient might have TYPHOID '),
nl,
write('Advices and Sugestions:'),
nl,
write('1: Consume high quantity of Fluids'),
nl,
write('2: Avoid raw fruits and veggies'),
nl,
write('3: Take proper rest'),
nl,
write('4: Take a protien and fibre rich diet'),
nl.

malaria :-
verify(fever),
verify(sweating),
verify(headache),
verify(nausea),
verify(vomiting),
verify(diarrhea),
write('The symptoms indicate that the patient might have MALARIA '),
nl,
write('Advices and Sugestions:'),
nl,
write('1: Consult a doctor'),
nl,
write('2: Follow a healthy diet plan'),
nl,
write('3: Take proper rest'),
nl,
write('Please do not sleep in open air'),
nl.

ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.

verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
