import static spark.Spark.*;
import com.google.gson.Gson;
import java.util.Map;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        port(3000);
        get("/", (req, res) -> {
            res.type("application/json");
            Map resp = new HashMap();
            resp.put("str", "hello");
            return new Gson().toJson(resp);
        });
    }
}
