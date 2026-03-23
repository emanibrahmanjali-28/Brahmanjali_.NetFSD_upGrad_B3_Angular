using System;

namespace ConsoleApp8
{
    class Program
    {
        static void Main(string[] args)
        {
            
            Console.Write("Enter Product Name: ");
            string productName = Console.ReadLine();

            Console.Write("Enter Product Price: ");
            double price = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Discount Percentage: ");
            double discount = Convert.ToDouble(Console.ReadLine());

            
            double discountAmount = price * discount / 100;

           
            double finalPrice = price - discountAmount;

            
            Console.WriteLine("\n--- Bill Details ---");
            Console.WriteLine($"Product Name: {productName}");
            Console.WriteLine($"Original Price: {price}");
            Console.WriteLine($"Discount: {discount}%");
            Console.WriteLine($"Discount Amount: {discountAmount}");
            Console.WriteLine($"Final Price: {finalPrice}");

            
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}