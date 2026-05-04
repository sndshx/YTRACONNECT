
import org.mindrot.jbcrypt.BCrypt;

public class GenerateRealHash {
    public static void main(String[] args) {
        String password = "asdf@123";
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed);
    }
}
