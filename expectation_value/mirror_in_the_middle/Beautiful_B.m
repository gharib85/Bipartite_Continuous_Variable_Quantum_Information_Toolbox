function result = Beautiful_B(t)

global information
alpha2 = information.alpha2;
beta2 = information.beta2;

result = exp( -beta2*(1 - exp( -2*1i*B(t) ) ) ).*exp( -alpha2*(1 - exp( 2*1i*B(t) ) ) );

end