import java.util.ArrayList;
import java.util.Map;

class UberVan extends Car{
    Map<String, ArrayList<String>> typeCarAcepted;
    ArrayList<String> seatsMaterial;

    public UberVan(String license, Account driver, Map<String, ArrayList<String>> typeCarAcepted, ArrayList<String> seatsMaterial) {
        super(license, driver);
        this.typeCarAcepted = typeCarAcepted;
        this.seatsMaterial = seatsMaterial;
    }
}