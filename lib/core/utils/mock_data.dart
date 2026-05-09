import '../models/product.dart';
import '../models/restaurant.dart';

class MockData {
  static final List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: "Bella Cucina",
      rating: 4.8,
      category: "Italian",
      distance: 2.4,
      address: "123 Main St",
      deliveryTimeMin: 25,
      deliveryTimeMax: 35,
      deliveryFee: 0.0,
      image: "https://lh3.googleusercontent.com/aida-public/AB6AXuBhRHWX1VV7YjHrvk9qzrzw44491gVdgEiCVCCagQ5DW2dQu28-pwjGrjf9gG1YyNZ2Rq8uZoQzh3JVbV4yzUnOC4_Hc5Huw0_nWM5_c8Y2-_pIXkyDQ2r82ZzEmyxjWYtVNKK81VYQj-pu--7ZNVRy2o83lZC9MtvK3S3QcsU9jxEwFFckAaegliraqIXE7lEsyk6MyWABKRwB0kPjmgCm_BJBST3znWhnSGm-lIS3LTIPMxPQOUnj6ML5iCSa854W5GXzzWQdiwKo",
      products: [
        Product(
          id: 1,
          name: "Stone Oven Margherita",
          price: 16.25,
          description: "Traditional tomato base, buffalo mozzarella, and fresh organic basil.",
          image: "https://lh3.googleusercontent.com/aida-public/AB6AXuB1qSWT013fX7Hjo62VyKyLxB5aLgaow_5MLq41tQtmW0G2Bk7tqqGBnTnbrqWZQ28iwTWT2gFnMvdcfMy0B9csamVNHrcVkYdxpbPrvqW9owkW2ZF1L84qhoDrb_FUWAeF9qO4Wa6_611M_FhwOpnbacbJd1c-ExIC-LzYw5Fc4PPXbUskSmYRaLrqN-IDlw1QWI_3FZBUrJoSYby2t0m6CFu0yadxXznQixJ3IVTYbCLhacC_myCQaPb69chN2l9y_ehAms2zbmi4",
        ),
      ],
    ),
    Restaurant(
      id: 2,
      name: "The Burger Smith",
      rating: 4.5,
      category: "Burgers",
      distance: 1.8,
      address: "42nd Central Avenue, NY",
      deliveryTimeMin: 15,
      deliveryTimeMax: 25,
      deliveryFee: 1.99,
      image: "https://lh3.googleusercontent.com/aida-public/AB6AXuDf0TlqyU7gWLtQ-1IORrxUSoDq5DkHxSrubtLip6fGkwfxCRPbzO92SA32n2Bh3jreIMK-jHLibniZ_ACoB1GHTmZeubIXjpG91KgUMmEux7ItluNWOQS-Eip4XLcRAi8XOATqBYbZP4PfmFohtyw0PA_Ewm47opNAmh-SC4ji_ZDqhYRQhImwPhCZcHCHtPWEtK5kiNiFMH-hiTv4kfJCWolmB_1UgrtN_vp0lrwqCOB28_VvO6IHhtp3wFJmAJxEOMCrx3VyRSCU",
      products: [
        Product(
          id: 2,
          name: "Signature Truffle Burger",
          price: 18.00,
          description: "Aged beef patty, truffle aioli, caramelised onions, and fontina cheese.",
          image: "https://lh3.googleusercontent.com/aida-public/AB6AXuDCXYqH1fVDGAttNyYT8f9zQ9QwWOMLPuLNVfcrdxUzf727GtY55UwoIXArZMfCHuVKJg4aYExWddoYvKQOIi5ae3BCHyheUZnb4dZ7E-aXuus0JD_r0bCl2lQKTe4GJ5zyVm0jDZimjhJSXKzxvbx7Y1jaR4BZvhNJn6v0CHD5m7a7bG4E0LqfaHMXPjWhgf2VDQfQ3IOo3zIEFItEip-FcsFtqiCKLrNhruVpGx1R_gs30p1l_NdwqYlh6I1wsPwKAOnU0f65trQz",
        ),
      ],
    ),
    Restaurant(
      id: 3,
      name: "Sakura Zen",
      rating: 4.9,
      category: "Sushi",
      distance: 3.2,
      address: "789 Pine St",
      deliveryTimeMin: 35,
      deliveryTimeMax: 45,
      deliveryFee: 2.99,
      image: "https://lh3.googleusercontent.com/aida-public/AB6AXuBQJI-bLHShgmY6-z_H66y9eOy3d9pTyaSuRoE-D6ly7xAM2b6O29XGgLluriIkJ9p0b9zGxUnya7wOFrSJAwrzZ_tnxydate3wJzbb3Ox9KwAygR9WzBIw2gk7zqUpXEHofZMmvDHvAl8Cpa60PJBvVWW1wj_DcQ8dR3RK2FQn5SARMPNy_PNVlEiEC1GDtlBzgxttDkMW2tckgZwCtjTv3kOjmGJWgZxhpO1f2nd2z9_j-g3opAtSbdDvZXmrT7cXsDM4LQ0G8sKT",
      products: [
        Product(
          id: 3,
          name: "Harvest Salad Bowl",
          price: 14.50,
          description: "Quinoa, baby spinach, roasted sweet potato, and honey lemon dressing.",
          image: "https://lh3.googleusercontent.com/aida-public/AB6AXuAKdWGO3zsN5h0clzHg1mAiz3ANfWdlSHpZl1wTlhC3DHYRasjwX7MuNXWDcD4I8EC5kyMuNF5UVh8Bt-JpXLkSjB0tBdW4iiPGCeckcprZGrm-IfLfQCt1bocU5lxpLyyrjiOs_ztrb0HU4Jy0-CjBFML_OTpH3V5osdXFKeO944iSuRefPvrQkrw-IMnTIN8syqYnGi5biBHWK8POEv4BtQAB5NarLoAGuY9xAy0DOtkclS6-QugU9n2o-f7xHec_LtAEJstvI_W6",
        ),
      ],
    ),
  ];
}
