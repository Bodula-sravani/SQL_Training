using Microsoft.Data.SqlClient;

namespace SQLConnection
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //string connectionString = "Data Source=DESKTOP-8C83AOT;Initial Catalog=PracticeDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False";
            string connectionString = "Data Source=DESKTOP-8C83AOT;Initial Catalog=PracticeDatabase;Integrated Security=True;Encrypt=False;";
            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();
            SqlCommand command1 = connection.CreateCommand();

            
            Console.WriteLine("Enter Id and name of technology to insert");
            int TechId = int.Parse( Console.ReadLine() );   
            string TechName = Console.ReadLine().Trim();
            command1.CommandText = $"insert into technologies values({TechId},'{TechName}')";
            command1.ExecuteReader().Close();


            Console.WriteLine("Enter technology name to be searchedd");
            TechName = Console.ReadLine().Trim();
            command1.CommandText = $"select * from technologies where name='{TechName}'";
            SqlDataReader reader = command1.ExecuteReader();
            Console.WriteLine($"Id       Name");
            while (reader.Read())
            {
                Console.WriteLine($"{reader.GetInt32(0)}        {reader.GetString(1)}");
            }
            reader.Close();



            connection.Close();
        }
    }
}