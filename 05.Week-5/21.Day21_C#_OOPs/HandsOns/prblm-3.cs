using System;

namespace OnlineShoppingCartSystem
{
    
    class Product
    {
       
        private string name;
        private double price;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public double Price
        {
            get { return price; }
            set
            {
                if (value < 0)
                {
                    Console.WriteLine("Price cannot be negative");
                }
                else
                {
                    price = value;
                }
            }
        }

        
        public Product(string name, double price)
        {
            Name = name;
            Price = price;
        }

      
        public virtual double CalculateDiscount()
        {
            return Price;
        }
    }

    class Electronics : Product
    {
        public Electronics(string name, double price) : base(name, price)
        {
        }

        public override double CalculateDiscount()
        {
            double discount = Price * 0.05;
            return Price - discount;
        }
    }

    class Clothing : Product
    {
        public Clothing(string name, double price) : base(name, price)
        {
        }

        public override double CalculateDiscount()
        {
            double discount = Price * 0.15;
            return Price - discount;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Product Type (1-Electronics, 2-Clothing):");
            int choice = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Enter Product Name:");
            string name = Console.ReadLine();

            Console.WriteLine("Enter Price:");
            double price = Convert.ToDouble(Console.ReadLine());

            Product product;

            if (choice == 1)
            {
                product = new Electronics(name, price);
            }
            else
            {
                product = new Clothing(name, price);
            }

            double finalPrice = product.CalculateDiscount();

            Console.WriteLine("Final Price after discount = " + finalPrice);
        }
    }
}