#include <iostream>
#include "../mpreal.h"

int main(int argc, char* argv[])
{
    using mpfr::mpreal;    
    using std::cout;
    using std::endl;
    
    // Required precision of computations in decimal digits
    // Play with it to check different precisions
    const int digits = 50; 

    // Setup default precision for all subsequent computations
    // MPFR accepts precision in bits - so we do the conversion 
    mpreal::set_default_prec(mpfr::digits2bits(digits));

    // Compute all the vital characteristics of mpreal (in current precision)
    // Analogous to lamch from LAPACK
    const mpreal one         =    1.0;
    const mpreal zero        =    0.0;
    const mpreal eps         =    std::numeric_limits<mpreal>::epsilon();
    const int    base        =    std::numeric_limits<mpreal>::radix;
    const mpreal prec        =    eps * base;
    const int bindigits      =    std::numeric_limits<mpreal>::digits(); // eqv. to mpfr::mpreal::get_default_prec();
    const mpreal rnd         =    std::numeric_limits<mpreal>::round_error();
    const mpreal maxval      =    std::numeric_limits<mpreal>::max();
    const mpreal minval      =    std::numeric_limits<mpreal>::min();
    const mpreal small       =    one / maxval;
    const mpreal sfmin       =    (small > minval) ? small * (one + eps) : minval;
    const mpreal round       =    std::numeric_limits<mpreal>::round_style();
    const int    min_exp     =    std::numeric_limits<mpreal>::min_exponent;
    const mpreal underflow   =    std::numeric_limits<mpreal>::min();
    const int    max_exp     =    std::numeric_limits<mpreal>::max_exponent;
    const mpreal overflow    =    std::numeric_limits<mpreal>::max();
    
    // Additionally compute pi with required accuracy - just for fun :)
    const mpreal pi          =    mpfr::const_pi();
        
    cout.precision(digits);    // Show all the digits
    cout << "pi         =    "<<    pi          << endl;    
    cout << "eps        =    "<<    eps         << endl;
    cout << "base       =    "<<    base        << endl;
    cout << "prec       =    "<<    prec        << endl;
    cout << "b.digits   =    "<<    bindigits   << endl;
    cout << "rnd        =    "<<    rnd         << endl;
    cout << "maxval     =    "<<    maxval      << endl;    
    cout << "minval     =    "<<    minval      << endl;    
    cout << "small      =    "<<    small       << endl;    
    cout << "sfmin      =    "<<    sfmin       << endl;    
    cout << "1/sfmin    =    "<<    1 / sfmin   << endl;    
    cout << "round      =    "<<    round       << endl;    
    cout << "max_exp    =    "<<    max_exp     << endl;
    cout << "min_exp    =    "<<    min_exp     << endl;
    cout << "underflow  =    "<<    underflow   << endl;    
    cout << "overflow   =    "<<    overflow    << endl;

    return 0;
}
