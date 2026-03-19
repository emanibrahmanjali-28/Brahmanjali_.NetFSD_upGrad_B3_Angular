using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem12
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

                        var result = (from p in products
                          select p.ProMrp).Max();

            Console.WriteLine("Maximum Price: " + result);

            Console.ReadLine();
        }
    }
}