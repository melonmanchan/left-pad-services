import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        port(3000);
        get("/", (req, res) -> "Hello world");
    }
}
