import com.carme.generator.GeneratorFactory;

/**
 * Created by admin on 2016/3/7.
 */
public class GeneratorServer {

    public static void main(String[] args) {

        try {
            GeneratorFactory.getInstance().create();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
