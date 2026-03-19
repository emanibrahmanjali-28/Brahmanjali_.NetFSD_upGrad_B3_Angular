using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem10
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

            
            var result = (from p in products
                          select p).Count();

            Console.WriteLine("Total Products Count: " + result);

            Console.ReadLine();
        }
    }
}