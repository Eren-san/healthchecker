import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
public class App {
    public static void main(String[] args) throws IOException, InterruptedException {
        Path filePath = Paths.get("sites.txt");
        if (!Files.exists(filePath)) {
            System.out.println("sites.txt file not found!");
            return;
        }

    List<String> sites = Files.readAllLines(filePath);

    for(String site: sites) {

    long startTime = System.nanoTime();
    HttpClient client = HttpClient.newHttpClient();
    HttpRequest request = HttpRequest.newBuilder()
          .uri(URI.create(site))
          .build();
    HttpResponse<String> response =
          client.send(request, BodyHandlers.ofString());
    long endTime = System.nanoTime();

    System.out.println("Response from site: " + site + " -> " + response.statusCode());
    System.out.println("Time duration: " + (endTime - startTime) / 1_000_000 + " ms");
    }
    }
}





