package indentation_api;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.json.simple.JSONObject;

public class run {

    public static void main(String[] args) throws Exception {
        String filePath = args[0];
        double codeLineCount = linesCount(filePath);
        JSONObject result = new JSONObject();

        String indentationOutput = "";
        String identifiersOutput = "";

        double indentationCount = 0;
        double idenftifersCount = 0;

        try {
            Process process = Runtime.getRuntime().exec(
                    "java -jar ./lib/checkstyle-8.26-all.jar -c google_checksindeni.xml " + filePath);

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;

            while ((line = reader.readLine()) != null) {
                if (line.contains("[Indentation]") || line.contains("[CommentsIndentation]")) {
                    indentationOutput += line.substring(line.lastIndexOf("java:") + 5);
                    indentationCount += 1;

                } else if (line.contains("[AbbreviationAsWordInName]")) {
                    identifiersOutput += line.substring(line.lastIndexOf("java:") + 5);
                    idenftifersCount += 1;
                }
            }
            result.put("Indentation output", indentationOutput);
            result.put("Identifiers output", identifiersOutput);
        } catch (IOException e) {
            throw e;
        }

        double indentationGrade = 1.0 - (indentationCount / codeLineCount);
        double identifiersGrade = 1.0 - (idenftifersCount / codeLineCount);
        result.put("Indentation Grade", indentationGrade);
        result.put("Identifiers Grade", identifiersGrade);
        System.out.println(result);
    }

    public static double linesCount(String filePath) throws Exception {
        double counter = 0;
        String line;
        try {
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            while ((line = reader.readLine()) != null) {
                counter++;
            }
            reader.close();
        } catch (Exception e) {
            throw e;
        }
        return counter;
    }
}
