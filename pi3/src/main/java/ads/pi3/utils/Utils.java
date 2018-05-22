package ads.pi3.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class Utils {
    public static String numToBrl(Double num) {        
        return NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(num);
    }
}
