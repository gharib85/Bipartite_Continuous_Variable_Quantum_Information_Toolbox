function result = A(t)

global information
alpha2 = information.alpha2;
beta2 = information.beta2;

result = exp( -alpha2*(1 - exp( -2*1i*B(t) ) ) ).*exp( -beta2*(1 - exp( 2*1i*B(t) ) ) );

end