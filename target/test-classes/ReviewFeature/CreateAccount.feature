@Smoke
Feature: Generate token, Create new account. Adding address , Adding phone number, Adding car

  Scenario: End to End Account Creation
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    Given path "api/accounts/add-primary-account"
    And request
      """
       {
        "email": "warishotak10000@gmail.com",
        "firstName": "Waris",
        "lastName": "Hotak",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Employee",
        "dateOfBirth": "2000-06-04",
        "new": true
        }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    * def ID = response.id
    Then print response
    Given path "/api/accounts/add-account-address"
    Given param primaryPersonId = ID
    Given header Authorization = "Bearer " + generatedToken
    Given request
      """
      {
      
      "addressType": "Apartment",
      "addressLine1": "325 s allen dr",
      "city": "allen",
      "state": "Texas",
      "postalCode": "1234",
      "countryCode": "4321",
      "current": true
      }
      """
    When method post
    Then status 201
    Then print response
    Given path "/api/accounts/add-account-phone"
    Given param primaryPersonId = ID
    Given header Authorization = "Bearer " + generatedToken
    Given request
      """
      {
        
        "phoneNumber": "1114697400",
        "phoneExtension": "123",
        "phoneTime": "Afternoon",
        "phoneType": "Home"
      }
      """
    When method post
    Then status 201
    Then print response
    Given path "/api/accounts/add-account-car"
    Given param primaryPersonId = ID
    Given header Authorization = "Bearer " + generatedToken
    Given request
      """
      {
        
        "make": "CHEVROLET",
        "model": "CRUZE",
        "year": "2012",
        "licensePlate": "ALLEN123"
      }

      """
    When method post
    Then status 201
    Then print response
