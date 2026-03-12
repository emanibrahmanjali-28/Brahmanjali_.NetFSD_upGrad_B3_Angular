using System;

namespace ConsoleApp2
{
    class Student
    {
        public double CalculateAverage(int m1, int m2, int m3)
        {
            return (m1 + m2 + m3) / 3.0;
        }

        public string GetGrade(double average)
        {
            if (average >= 90) return "A+";
            else if (average >= 80) return "A";
            else if (average >= 70) return "B";
            else if (average >= 60) return "C";
            else if (average >= 50) return "D";
            else return "F";
        }

        public bool IsValidMark(int mark)
        {
            return mark >= 0 && mark <= 100;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Student student = new Student();

            Console.Write("Enter marks of subject 1 : ");
            int mark1 = int.Parse(Console.ReadLine());
            Console.Write("Enter marks of subject 2 : ");
            int mark2 = int.Parse(Console.ReadLine());
            Console.Write("Enter marks of subject 3 : ");
            int mark3 = int.Parse(Console.ReadLine());

            // Validatation
            if (!student.IsValidMark(mark1) || !student.IsValidMark(mark2) || !student.IsValidMark(mark3))
            {
                Console.WriteLine("Invalid input! All marks must be between 0 and 100.");
                return; 
            }

            double avg = student.CalculateAverage(mark1, mark2, mark3);
            string grade = student.GetGrade(avg);

            Console.WriteLine($"Average = {avg}, Grade = {grade}");
        }
    }
}