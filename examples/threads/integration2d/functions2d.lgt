
:- object(functions2d).

	:- info([
		version is 1.0,
		author is 'Paul Crocker',
		date is 2008/07/19,
		comment is 'Example functions of two variables']).

	:- public(eval/4).
	:- mode(eval(+atom, +float,+float, -float), one).
	:- info(eval/4, [
		comment is 'Calculates the function value.',
		argnames is ['Function', 'X', 'Y', 'Fxy']]).

	% A circle - f(x,y) = x*x+y*y - raio*raio :  exp(x) [0,4] 
	% Integral = 8.0
	eval(circle, X, Y, Fxy) :-
		Fxy is X*X + Y*Y - 2*2.

	% [-2,2-2,2]
	% Integral = 11.947778
	eval(i14, X, Y, Fxy) :-
		Fxy is  5.0 / (1.0 + 4.0*(X*X + Y*Y)).

	% [-2,2-2,2]
	% Integral = 7.7359
	eval(i15, X, Y, Fxy) :-
		F is sin(6*X*Y), Fxy is F*F.

	% [0,1,0,1]   
	% Integral is sqrt(2)/3 - log(2)/6 + log(2+sqrt(2))/3
	% Integral  = 0.765196
	eval(bailey1, X, Y, Fxy) :-
		Fxy is sqrt(X*X + Y*Y).

	% [0,1,0,1] 
	% Integral is (-sqrt(2)/3.0 - log(sqrt(2)-1)/2 + log(sqrt(2)+1)/2+2/3 )
	% Integral = 1.07664
	eval(bailey2, X, Y, Fxy) :-
		Fxy is sqrt(1.0 + (X-Y) * (X-Y)).

	% [-1,1,-1,1]
	% Integral is (4*log(2+sqrt(3))-2*pi/3)
	% Integral = 3.17344
	eval(bailey3, X, Y, Fxy) :-
		Fxy is 1.0 / sqrt(1.0 + (X*X) + (Y*Y)).

	%    [0,pi,0,pi]
	eval(bailey4, X, Y, Fxy) :-
		Fxy is log(2.0 - cos(X) - cos(Y)).

	% [0,inf,0,inf] --> use inf=400 above gives strange result ...
	% Integral is 1 + 3*log(3)/4.
	% Integral = 1.82396
	eval(bailey5, X, Y, Fxy) :-
		Fxy is sqrt(X*X + Y*Y + Y*X) * exp(-X-Y).

:- end_object.
