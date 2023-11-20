/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <iostream>
#include <cmath>

// Funkcija za izračun e^(3x)
double exp3x(double x) {
    return std::exp(3 * x);
}

// Funkcija za izračun arctan(x/2) s Taylorjevo vrsto
double arctanTaylor(double x, int terms) {
    double rezultat = 0.0;
    for (int n = 0; n < terms; ++n) {
        rezultat += (std::pow(-1, n) / (2 * n + 1)) * std::pow(x / 2, 2 * n + 1);
    }
    return rezultat;
}

// Funkcija za trapezno integracijo
double trapezoidalIntegration(double (*f)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double vsota = 0.5 * (f(a) + f(b));
    for (int i = 1; i < n; ++i) {
        vsota += f(a + i * h);
    }
    return h * vsota;
}

int main() {
    // Določitev območja integracije
    double a = 0.0;
    double b = M_PI / 4.0;

    // Število podintervalov
    int n;
    std::cout << "Vstavi število podintervalov (n): "; // Št. podintervalov lahko prilagodite za večjo ali manjšo natančnost rezultata
    std::cin >> n;
    
    // Izvedba trapezne integracije
    double rezultat = trapezoidalIntegration([](double x) {
        return exp3x(x) * arctanTaylor(x, 20); // Uporaba 20 členov za Taylorjevo vrsto arctan
    }, a, b, n);

    // Prikaz rezultatov
    std::cout << "Rezultat trapezne integracije za funkcijo e^(3x)*arctan(x/2): " << rezultat << std::endl;

    return 0;
}