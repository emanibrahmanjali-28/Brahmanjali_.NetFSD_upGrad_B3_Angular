using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem13
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();


            var result = (from p in products
                          select p.ProMrp).Min();

            Console.WriteLine("Minimum Price: " + result);

            Console.ReadLine();
        }
    }
}