using System;

namespace NumericalIntegration
{
    class Program
    {
        static double PolynomialFunction(double[] coefficients, double x)
        {
            double result = 0;
            for (int i = 0; i < coefficients.Length; i++)
            {
                result += coefficients[i] * Math.Pow(x, i);
            }
            return result;
        }

        static double RPNCalculator(string expression, double x)
        {
            // Implement RPN calculator here
            return 0;
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Enter type of function (1 for polynomial, 2 for RPN):");
            int functionType = int.Parse(Console.ReadLine());
            double[] coefficients = new double[10];
            string expression = "";
            double a, b;
            int n;

            if (functionType == 1)
            {
                Console.WriteLine("Enter coefficients of polynomial function (up to 10):");
                for (int i = 0; i < 10; i++)
                {
                    coefficients[i] = double.Parse(Console.ReadLine());
                }
                Console.WriteLine("Polynomial function:");
                for (int i = 10; i >= 0; i--)
                {
                    if (coefficients[i] != 0)
                    {
                        Console.Write("{0}x^{1}", coefficients[i], i);
                        if (i > 0)
                        {
                            Console.Write(" + ");
                        }
                    }
                }
                Console.WriteLine();
            }
            else if (functionType == 2)
            {
                Console.WriteLine("Enter function in RPN form:");
                expression = Console.ReadLine();
            }

            Console.WriteLine("Enter integration bounds:");
            Console.Write("a = ");
            a = double.Parse(Console.ReadLine());
            Console.Write("b = ");
            b = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter number of intervals:");
            n = int.Parse(Console.ReadLine());

            double h = (b - a) / n;
            double resultTrapezoidal = 0;
            double resultSimpson = 0;
            for (int i = 1; i < n; i++)
            {
                double x = a + i * h;
                resultTrapezoidal += (functionType == 1 ? PolynomialFunction(coefficients, x) : RPNCalculator(expression, x));
                if (i % 2 == 0)
                {
                    resultSimpson += 2 * (functionType == 1 ? PolynomialFunction(coefficients, x) : RPNCalculator(expression, x));
                }
                else
                {
                    resultSimpson += 4 * (functionType == 1 ? PolynomialFunction(coefficients, x) : RPNCalculator(expression, x));
                }
            }
            resultTrapezoidal = (h / 2) * (PolynomialFunction(coefficients, a) + PolynomialFunction(coefficients, b) + 2 * resultTrapezoidal);
            resultSimpson = (h / 3) * (PolynomialFunction(coefficients, a) + PolynomialFunction(coefficients, b) + resultSimpson);

            Console.WriteLine("Trapezoidal rule result: {0}", resultTrapezoidal);
            Console.WriteLine("Simpson's rule result: {0}", resultSimpson);
        }
    }
}


