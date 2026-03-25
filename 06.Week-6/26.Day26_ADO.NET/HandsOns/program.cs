using System;

namespace ConsoleApp9
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ProductDAL dal = new ProductDAL();

            while (true)
            {
                Console.WriteLine("\n====== PRODUCT MANAGEMENT ======");
                Console.WriteLine("1. Insert Product");
                Console.WriteLine("2. Get Product By ID");
                Console.WriteLine("3. Update Product");
                Console.WriteLine("4. Delete Product");
                Console.WriteLine("5. Exit");
                Console.Write("Enter choice: ");

                int choice;
                if (!int.TryParse(Console.ReadLine(), out choice))
                {
                    Console.WriteLine("Invalid input");
                    continue;
                }

                switch (choice)
                {
                    case 1:
                        Product p = new Product();

                        Console.Write("Name: ");
                        p.ProductName = Console.ReadLine();

                        Console.Write("Category: ");
                        p.Category = Console.ReadLine();

                        Console.Write("Price: ");
                        p.Price = Convert.ToDecimal(Console.ReadLine());

                        dal.InsertProduct(p);
                        break;

                    case 2:
                        Console.Write("Enter Product ID: ");
                        int id = Convert.ToInt32(Console.ReadLine());

                        Product result = dal.GetProductById(id);

                        if (result != null)
                        {
                            Console.WriteLine($"{result.ProductId} | {result.ProductName} | {result.Category} | {result.Price}");
                        }
                        else
                        {
                            Console.WriteLine("Product not found");
                        }
                        break;

                    case 3:
                        Product up = new Product();

                        Console.Write("Enter ID: ");
                        up.ProductId = Convert.ToInt32(Console.ReadLine());

                        Console.Write("New Name: ");
                        up.ProductName = Console.ReadLine();

                        Console.Write("New Category: ");
                        up.Category = Console.ReadLine();

                        Console.Write("New Price: ");
                        up.Price = Convert.ToDecimal(Console.ReadLine());

                        dal.UpdateProduct(up);
                        break;

                    case 4:
                        Console.Write("Enter ID: ");
                        int deleteId = Convert.ToInt32(Console.ReadLine());

                        dal.DeleteProduct(deleteId);
                        break;

                    case 5:
                        return;

                    default:
                        Console.WriteLine("Invalid choice");
                        break;
                }
            }
        }
    }
}