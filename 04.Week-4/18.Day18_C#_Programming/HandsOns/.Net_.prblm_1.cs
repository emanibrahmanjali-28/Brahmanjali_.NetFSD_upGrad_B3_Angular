namespace ConsoleApp4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello, World!");
            
               
                Console.WriteLine("Enter Name: ");
                string name = Console.ReadLine();

              
                Console.WriteLine("Enter Marks: ");
                int marks = Convert.ToInt32(Console.ReadLine());

                
                if (marks < 0 || marks > 100)
                {
                    Console.WriteLine("Invalid marks! Please enter marks between 0 and 100.");
                }
                else
                {
                    string grade;

                    
                    if (marks >= 90)
                    {
                        grade = "A";
                    }
                    else if (marks >= 75)
                    {
                        grade = "B";
                    }
                    else if (marks >= 60)
                    {
                        grade = "C";
                    }
                    else if (marks >= 40)
                    {
                        grade = "D";
                    }
                    else
                    {
                        grade = "Fail";
                    }

                    
                    Console.WriteLine("Student: " + name);
                    Console.WriteLine("Grade: " + grade);
                }
            }
    
    }
}







