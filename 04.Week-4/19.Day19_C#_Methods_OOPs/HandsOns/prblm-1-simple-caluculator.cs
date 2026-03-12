using System;

namespace ConsoleApp2
{
    
   class Calculator
    {
        
        public int Add(int a, int b)
        {
            
            return a + b;
        }

        public int Subtract(int a, int b)
        {
            
            return a - b;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
           
            Console.Write("Enter first number: ");
            string input1 = Console.ReadLine();
            Console.Write("Enter second number: ");
            string input2 = Console.ReadLine();

            // validation
            bool isValid1 = int.TryParse(input1, out int num1);
            bool isValid2 = int.TryParse(input2, out int num2);

            if (!isValid1 || !isValid2)
            {
                Console.WriteLine("Invalid input! Please enter valid integers.");
                return; 
            }

            
            Calculator calc = new Calculator();

            int sum = calc.Add(num1, num2);

            int difference = calc.Subtract(num1, num2);

           
            Console.WriteLine($"Addition = {sum}, Subtraction = {difference}");
        }
    }
}