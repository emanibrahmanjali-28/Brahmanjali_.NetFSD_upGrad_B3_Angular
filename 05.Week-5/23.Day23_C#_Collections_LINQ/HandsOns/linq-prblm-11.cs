using System;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Problem11
    {
        static void Main()
        {
            Product product = new Product();

            var products = product.GetProducts();

            
            var result = (from p in products
                          where p.ProCategory == "FMCG"
                          select p).Count();

            Console.WriteLine("Total FMCG Products Count: " + result);

            Console.ReadLine();
        }
    }
}