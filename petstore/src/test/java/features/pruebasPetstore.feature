Feature: Gestión de clientes en Petstore


  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear nuevo usuario
    * def newUser =
   """{
  "id": 1547772,
  "username": "Juan0889",
  "firstName": "Juan",
  "lastName": "Perez",
  "email": "juanpets@gmail.com",
  "password": "88754129",
  "phone": "3002225566",
  "userStatus": 1
    }"""

    Given path 'user'
    And request newUser
    When method post
    Then match response == {code: 200, type: 'unknown', message: '1547772'}

  Scenario: Buscar usuario creado
    def username = "Juan0889"
    Given path 'user/username'
    When method get
    Then status 200
    And match response == "id":9223372036854756599,"username":"username","firstName":"firstName","lastName":"lastName","email":"email","password":"password","phone":"phone","userStatus":0}

