public with sharing class ExchangeRateDTO {

        public String status;
        public Data data;
        public Integer seed;
    
        public class Data {
            public String currency_from;
            public String currency_to;
            public Double rate;
        }
    
        
        public static ExchangeRateDTO parse(String json) {
            return (ExchangeRateDTO) System.JSON.deserialize(json, ExchangeRateDTO.class);
        }
    }
