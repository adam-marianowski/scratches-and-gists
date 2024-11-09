var people = new List<Person>
{
    new("John", 30),
    new("Jane", 25),
    new("Jack", 40)
};

var json = JsonSerializer.Serialize(people);
File.WriteAllText("people.json", json);