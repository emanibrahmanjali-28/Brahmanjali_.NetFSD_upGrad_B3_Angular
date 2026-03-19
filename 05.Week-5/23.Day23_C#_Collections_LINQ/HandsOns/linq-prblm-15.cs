using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem15
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

           
            var result = (from p in products
                          select p).Any(p => p.ProMrp < 30);

            Console.WriteLine("Any product below Rs.30: " + result);

            Console.ReadLine();
        }
    }
}