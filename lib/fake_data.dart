import 'package:noon_demo/modal/brand.dart';
import 'package:noon_demo/modal/internal_storage.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:noon_demo/modal/ram.dart';

class FakeData {
  static const twoGB = RAM(id: "1", title: "2 GB", value: 2);
  static const fourGB = RAM(id: "2", title: "4 GB", value: 4);
  static const sixGB = RAM(id: "3", title: "6 GB", value: 6);
  static const eightGB = RAM(id: "4", title: "8 GB", value: 8);
  static const twelveGB = RAM(id: "5", title: "12 GB", value: 12);
  static const availableRamSizes = [
    twoGB,
    fourGB,
    sixGB,
    eightGB,
    twelveGB,
  ];

  static const storage64GB = InternalStorage(id: "1", title: "64 GB Storage", value: 64);
  static const storage128GB = InternalStorage(id: "2", title: "128 GB Storage", value: 128);
  static const storage256GB = InternalStorage(id: "3", title: "256 GB Storage", value: 256);
  static const storage512GB = InternalStorage(id: "4", title: "512 GB Storage", value: 512);
  static const storage1TB = InternalStorage(id: "5", title: "1 TB Storage", value: 1024);

  static const availableInternalStorage = [
    storage64GB,
    storage128GB,
    storage256GB,
    storage512GB,
    storage1TB,
  ];

  static const samsung = Brand(id: "1", name: "Samsung", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/feb36436-0309-4531-8bdf-626e2c25d96f.png");
  static const apple = Brand(id: "2", name: "Apple", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/5fb9ca90-c833-4d5e-8315-9bba2880365c.png");
  static const huawei = Brand(id: "3", name: "Huawei", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/b4a1c3bc-7b74-45c4-aca6-37d1162eedc9.png");
  static const motorola = Brand(id: "4", name: "Motorola", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/f295567a-a80b-4f2b-bd58-deb05f726eb2.png");
  static const onePlus = Brand(id: "5", name: "OnePlus", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/b2824a45-9674-47fd-8ca9-3caa3ad70002.png");
  static const realme = Brand(id: "6", name: "Realme", imageUrl: "https://f.nooncdn.com/mpcms/EN0001/assets/a0d63a05-246d-47c9-9174-5785abe03c3f.png");

  static const List<Brand> brands = [
    samsung,
    apple,
    huawei,
    motorola,
    onePlus,
    realme,
  ];

  static List<Product> products = const [
    Product(
      id: "1",
      title: "Galaxy A14 Dual Sim Black 4GB RAM 64GB 4G - Middle East Version",
      ram: fourGB,
      internalStorage: storage64GB,
      modalYear: 2019,
      price: 407.00,
      brand: samsung,
      rating: 3.4,
      color: "Black",
      images: [
        "https://f.nooncdn.com/p/v1687430492/N53379529A_1.jpg",
        "https://f.nooncdn.com/p/v1679914977/N53379529A_2.jpg",
        "https://f.nooncdn.com/p/v1679914978/N53379529A_3.jpg",
      ],
    ),
    Product(
      id: "2",
      title: "Y9 (2019) Dual SIM Black 6GB RAM 128GB 4G LTE",
      ram: sixGB,
      internalStorage: storage128GB,
      price: 262.00,
      brand: huawei,
      rating: 4.2,
      color: "Black",
      images: [
        "https://f.nooncdn.com/p/v1686663823/N18768182A_1.jpg",
        "https://f.nooncdn.com/p/v1539176434/N18768182A_2.jpg",
        "https://f.nooncdn.com/p/v1539176442/N18768182A_3.jpg",
      ],
    ),
    Product(
      id: "3",
      title: "Nord CE 3 Lite Dual Sim Pastel Lime 8GB RAM 128GB 5G - International Version",
      ram: eightGB,
      internalStorage: storage128GB,
      price: 789.00,
      brand: onePlus,
      rating: 4.1,
      color: "Green",
      images: [
        "https://f.nooncdn.com/p/v1687265344/N53396271A_1.jpg",
        "https://f.nooncdn.com/p/v1680251800/N53396271A_2.jpg",
        "https://f.nooncdn.com/p/v1680251799/N53396271A_3.jpg",
        "https://f.nooncdn.com/p/v1680251799/N53396271A_4.jpg",
      ],
    ),
    Product(
      id: "4",
      title: "Nord N20 SE Dual SIM Celestial Black 4GB RAM 128GB 4G - Global Version",
      ram: fourGB,
      internalStorage: storage128GB,
      price: 459.00,
      brand: onePlus,
      rating: 4.2,
      color: "Black",
      images: [
        "https://f.nooncdn.com/p/v1687265279/N53343798A_1.jpg",
        "https://f.nooncdn.com/p/v1660961010/N53343798A_2.jpg",
        "https://f.nooncdn.com/p/v1660961010/N53343798A_3.jpg",
        "https://f.nooncdn.com/p/v1660961010/N53343798A_5.jpg",
        "https://f.nooncdn.com/p/v1660961010/N53343798A_6.jpg",
      ],
    ),
    Product(
      id: "5",
      title: "Galaxy M33 Dual SIM Mystique Green 6GB RAM 128GB 5G - International Version",
      ram: sixGB,
      internalStorage: storage128GB,
      price: 680.00,
      brand: samsung,
      rating: 3.9,
      color: "Deep Ocean Blue",
      images: [
        "https://f.nooncdn.com/p/v1687430459/N53326250A_1.jpg",
        "https://f.nooncdn.com/p/v1652880803/N53326250A_2.jpg",
        "https://f.nooncdn.com/p/v1652880803/N53326250A_3.jpg",
      ],
    ),
    Product(
      id: "6",
      title: "Galaxy S23 Ultra 5G Dual SIM Green 12GB RAM 256GB - Middle East Version",
      ram: twelveGB,
      internalStorage: storage256GB,
      price: 3222.00,
      brand: samsung,
      rating: 4.5,
      color: "Green",
      images: [
        "https://f.nooncdn.com/p/v1687430481/N53374466A_1.jpg",
        "https://f.nooncdn.com/p/v1675009318/N53374466A_2.jpg",
        "https://f.nooncdn.com/p/v1675009317/N53374466A_5.jpg",
        "https://f.nooncdn.com/p/v1675009319/N53374466A_4.jpg",
      ],
    ),
    Product(
      id: "7",
      title: "Galaxy Z Flip 5 Dual SIM Graphite 8GB RAM 256GB 5G - International Version",
      ram: eightGB,
      internalStorage: storage256GB,
      price: 2375.00,
      brand: samsung,
      rating: 3.8,
      color: "Lavender",
      images: [
        "https://f.nooncdn.com/p/v1690888772/N53424149A_1.jpg",
        "https://f.nooncdn.com/p/v1690888770/N53424149A_2.jpg",
        "https://f.nooncdn.com/p/v1690888771/N53424149A_3.jpg",
        "https://f.nooncdn.com/p/v1690888771/N53424149A_4.jpg",
        "https://f.nooncdn.com/p/v1690888771/N53424149A_6.jpg",
      ],
    ),
    Product(
      id: "8",
      title: "iPhone 14 Pro Max 256GB Deep Purple 5G With FaceTime - Middle East Version",
      ram: sixGB,
      internalStorage: storage256GB,
      price: 4539.00,
      brand: apple,
      rating: 4.6,
      color: "Deep Purple",
      images: [
        "https://f.nooncdn.com/p/v1686132022/N53346840A_1.jpg",
        "https://f.nooncdn.com/p/v1662640953/N53346840A_2.jpg",
        "https://f.nooncdn.com/p/v1662640954/N53346840A_3.jpg",
      ],
    ),
    Product(
      id: "9",
      title: "iPhone 15 256GB Blue 5G With FaceTime - International Version",
      ram: sixGB,
      internalStorage: storage256GB,
      price: 3798.00,
      brand: apple,
      rating: 4.3,
      color: "Blue",
      images: [
        "https://f.nooncdn.com/p/pnsku/N53433288A/45/_/1694762131/e4a90459-af36-404a-bc37-e454153ef6ba.jpg",
        "https://f.nooncdn.com/p/pnsku/N53433288A/45/_/1694762132/73140b61-16b8-46d5-abbb-cc492b3addfc.jpg",
        "https://f.nooncdn.com/p/pnsku/N53433288A/45/_/1694762133/6d419215-2b72-4a5e-b9ac-45220f1bcda3.jpg",
        "https://f.nooncdn.com/p/pnsku/N53433288A/45/_/1694762132/16270b6a-de43-481a-ac0a-c6decf4dea2d.jpg",
        "https://f.nooncdn.com/p/pnsku/N53433288A/45/_/1694762133/4865a970-bcf6-4873-af40-bfc58611f085.jpg",
      ],
    ),
    Product(
      id: "10",
      title: "Tab S6 lite(2022) 10.4 inch Oxford Gray 4GB RAM 64GB Wi-Fi - UAE Version",
      ram: fourGB,
      internalStorage: storage64GB,
      price: 809.00,
      brand: samsung,
      rating: 4.4,
      color: "Black",
      images: [
        "https://f.nooncdn.com/p/v1687430465/N53336820A_1.jpg",
        "https://f.nooncdn.com/p/v1658307693/N53336820A_2.jpg",
      ],
    ),
    Product(
      id: "11",
      title: "P30 Pro Dual SIM Breathing Crystal 256GB 8GB RAM 4G LTE",
      ram: eightGB,
      internalStorage: storage256GB,
      price: 1499.00,
      brand: huawei,
      rating: 3.1,
      color: "Breathing Crystal",
      images: [
        "https://f.nooncdn.com/p/v1686663831/N22924820A_1.jpg",
        "https://f.nooncdn.com/p/v1553837288/N22924820A_2.jpg",
        "https://f.nooncdn.com/p/v1553837289/N22924820A_3.jpg",
        "https://f.nooncdn.com/p/v1553837289/N22924820A_4.jpg",
      ],
    ),
    Product(
      id: "12",
      title: "iPad Pro 2022 (6th Gen) 12.9 inch Space Gray 128GB 5G - International Version",
      ram: sixGB,
      internalStorage: storage128GB,
      price: 3839.00,
      brand: apple,
      rating: 4.7,
      color: "Space Gray",
      images: [
        "https://f.nooncdn.com/p/v1686137280/N53359844A_1.jpg",
        "https://f.nooncdn.com/p/v1666857033/N53359844A_2.jpg",
        "https://f.nooncdn.com/p/v1666857033/N53359844A_3.jpg",
      ],
    ),
    Product(
      id: "13",
      title: "Galaxy A54 Dual Sim Awesome Graphite 8GB RAM 256GB 5G - International Version",
      ram: eightGB,
      internalStorage: storage256GB,
      price: 1149.00,
      brand: samsung,
      rating: 4.4,
      color: "Awesome Graphite",
      images: [
        "https://f.nooncdn.com/p/v1687521112/N53395495A_1.jpg",
        "https://f.nooncdn.com/p/v1681284151/N53395495A_2.jpg",
        "https://f.nooncdn.com/p/v1681284151/N53395495A_3.jpg",
        "https://f.nooncdn.com/p/v1681284151/N53395495A_4.jpg",
      ],
    ),
    Product(
      id: "14",
      title: "iPhone 11 Black 128GB 4G LTE (2020 - Slim Packing) - International Version",
      ram: sixGB,
      internalStorage: storage128GB,
      price: 1803.00,
      brand: apple,
      rating: 4.5,
      color: "Black",
      images: [
        "https://f.nooncdn.com/p/v1686205660/N41233411A_1.jpg",
        "https://f.nooncdn.com/p/v1667937176/N41233411A_2.jpg",
        "https://f.nooncdn.com/p/v1667937176/N41233411A_3.jpg",
      ],
    ),
    Product(
      id: "15",
      title: "Galaxy A53 Dual SIM Awesome Blue 8GB RAM 256GB 5G - Middle East Version",
      ram: eightGB,
      internalStorage: storage256GB,
      price: 1049.00,
      brand: samsung,
      rating: 4.7,
      color: "Awesome Blue",
      images: [
        "https://f.nooncdn.com/p/v1687430451/N52738730A_1.jpg",
        "https://f.nooncdn.com/p/v1645791460/N52738730A_2.jpg",
        "https://f.nooncdn.com/p/v1645791459/N52738730A_3.jpg",
        "https://f.nooncdn.com/p/v1645791460/N52738730A_8.jpg",
      ],
    ),
    Product(
      id: "16",
      title: "Moto G54 5G Single + eSim Midnight Blue 8GB RAM 256GB with Anker U2i BT Headset - Middle East Version",
      ram: eightGB,
      internalStorage: storage256GB,
      price: 599.00,
      brand: motorola,
      rating: 4.9,
      color: "Midnight Blue",
      images: [
        "https://f.nooncdn.com/p/pnsku/N53337009A/45/_/1695903593/b08c0338-fcd2-4fcf-93ff-750e9f0a2e10.jpg",
        "https://f.nooncdn.com/p/pnsku/N53337009A/45/_/1696402673/d16eaac1-cf32-4b22-a857-c9d922e2f39b.jpg",
        "https://f.nooncdn.com/p/pnsku/N53337009A/45/_/1696402674/65fd5d7e-112b-4887-84a6-e34c4d5b6f84.jpg",
        "https://f.nooncdn.com/p/pnsku/N53337009A/45/_/1696402675/78450c33-3b76-4091-8383-6e752f2486e7.jpg",
      ],
    ),
    Product(
      id: "17",
      title: "11 Pro+ Sunrise Beige Dual Sim 12GB RAM 512GB 5G - Middle East Version",
      ram: twelveGB,
      internalStorage: storage512GB,
      price: 1249.00,
      brand: realme,
      rating: 4.6,
      color: "Sunrise Beige",
      images: [
        "https://f.nooncdn.com/p/v1685761306/N53410883A_1.jpg",
        "https://f.nooncdn.com/p/v1685761305/N53410883A_2.jpg",
        "https://f.nooncdn.com/p/v1685761306/N53410883A_3.jpg",
        "https://f.nooncdn.com/p/v1685761306/N53410883A_4.jpg",
      ],
    ),
  ];
}
