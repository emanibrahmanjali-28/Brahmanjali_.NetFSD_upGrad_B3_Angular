using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem14
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

           
            var result = (from p in products
                          select p).All(p => p.ProMrp < 30);

            Console.WriteLine("All products below Rs.30: " + result);

            Console.ReadLine();
        }
    }
}