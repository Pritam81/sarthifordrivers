import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedGender;
  String? selectedState;
  String? selectedCity;

  List<String> genderList = ["Male", "Female", "Other"];
  List<String> stateList = [];
  List<String> cityList = [];

  bool obscurePassword = true;

  bool _agree = false;

  @override
  void initState() {
    super.initState();
    fetchStates();
  }

  Map<String, String> stateCodeMap = {};

  Future<void> fetchStates() async {
    final response = await http.get(
      Uri.parse("https://api.countrystatecity.in/v1/countries/IN/states"),
      headers: {
        "X-CSCAPI-KEY":
            "TWFHNnBsR3Fya0d6OTl1ejV1QWNMOHZDQ3hUa1RNVUdIQzN0YlVtYg==",
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        stateList = data.map((item) => item['name'].toString()).toList();
        for (var item in data) {
          stateCodeMap[item['name']] =
              item['iso2']; // Save ISO2 code for each state
        }
      });
    }
  }

  Future<void> fetchCities(String stateName) async {
    String? isoCode = stateCodeMap[stateName];
    if (isoCode == null) return;

    final response = await http.get(
      Uri.parse(
        "https://api.countrystatecity.in/v1/countries/IN/states/$isoCode/cities",
      ),
      headers: {
        "X-CSCAPI-KEY":
            "TWFHNnBsR3Fya0d6OTl1ejV1QWNMOHZDQ3hUa1RNVUdIQzN0YlVtYg==",
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        cityList = data.map((item) => item['name'].toString()).toList();
      });
    } else {
      print("City API failed: ${response.body}");
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Proceed with registration
      print("Name: ${nameController.text}");
      print("Email: ${emailController.text}");
      print("Phone: +91 ${phoneController.text}");
      print("Gender: $selectedGender");
      print("State: $selectedState");
      print("City: $selectedCity");
      print("Address: ${addressController.text}");
      print("Password: ${passwordController.text}");
    }
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              "Terms and Conditions",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2758AD),
              ),
            ),
            content: const Text(
              " ABHI ISME TNC AYEGA.",
              style: TextStyle(fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(
                  "Close",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2758AD),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 39, 88, 173),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Fill your information below to register.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),
              const SizedBox(height: 15),

              // Name Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: _inputDecoration(
                    "Full Name",
                    "Enter your full name",
                    Icons.person,
                  ),
                  validator:
                      (value) =>
                          value == null || value.trim().isEmpty
                              ? "Name is required"
                              : null,
                ),
              ),
              const SizedBox(height: 10),
              // Email Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: _inputDecoration(
                    "Email",
                    "Enter your email Id",
                    Icons.email,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter your phone number",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    prefixIcon: Container(
                      width: 65,
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "+91",
                            style: TextStyle(
                              color: Color(0xFF2758AD),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "|",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDEE1E6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF2758AD),
                        width: 1.8,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Phone number is required";
                    }
                    if (value.length != 10 ||
                        !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Enter a valid 10-digit number";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF2758AD),
                  ),
                  decoration: InputDecoration(
                    labelText: "Gender",
                    hintText: "Gender",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF2758AD),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDEE1E6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF2758AD),
                        width: 1.8,
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Male", child: Text("Male")),
                    DropdownMenuItem(value: "Female", child: Text("Female")),
                    DropdownMenuItem(value: "Other", child: Text("Other")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select your gender";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),

              /// Row with State and City
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    /// State Dropdown
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedState,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF2758AD),
                          ),
                          decoration: InputDecoration(
                            labelText: "State",
                            hintText: "State",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF2758AD),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFDEE1E6),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E3E8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF2758AD),
                                width: 1.8,
                              ),
                            ),
                          ),
                          items:
                              stateList.map((state) {
                                return DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                              selectedCity = null;
                              cityList.clear();
                              fetchCities(value!);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select your state";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    /// City Dropdown
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedCity,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF2758AD),
                          ),
                          decoration: InputDecoration(
                            labelText: "City",
                            hintText: "Select your city",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            prefixIcon: const Icon(
                              Icons.location_city,
                              color: Color(0xFF2758AD),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFDEE1E6),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E3E8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF2758AD),
                                width: 1.8,
                              ),
                            ),
                          ),
                          items:
                              cityList.map((city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select your city";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: addressController,

                  decoration: InputDecoration(
                    labelText: "Address",
                    hintText: "Enter your full address",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    prefixIcon: const Icon(
                      Icons.home_outlined,
                      color: Color(0xFF2758AD),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDEE1E6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF2758AD),
                        width: 1.8,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Address is required";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Checkbox and Terms
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Checkbox(
                        value: _agree,
                        onChanged: (val) => setState(() => _agree = val!),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    const SizedBox(width: 0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            const TextSpan(text: "I agree with "),
                            TextSpan(
                              text: "Terms and Conditions",
                              style: const TextStyle(
                                color: Color(0xFF2758AD),
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = _showTermsDialog,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              // Sign up button
              ElevatedButton(
                onPressed: _submitForm,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 103.0,
                  ),
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2758AD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Image.asset("assets/images/items.png", width: 150, height: 60),
              const SizedBox(height: 08),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                  children: [
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign in",
                      style: const TextStyle(
                        color: Color(0xFF2758AD),
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/login',
                              ); // or pushNamed
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      prefixIcon: Icon(icon, color: const Color(0xFF2758AD)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDEE1E6)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2758AD), width: 1.8),
      ),
    );
  }
}
