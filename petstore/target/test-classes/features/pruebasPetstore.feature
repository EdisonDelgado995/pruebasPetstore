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
    When method POST
    Then match response == {code: 200, type: 'unknown', message: '1547772'}

  Scenario: Buscar usuario creado
    * def username = "Juan0889"
    Given path 'user/' + username
    When method GET
    Then status 200
    And match response == {"id":1547772,"username":"Juan0889","firstName":"Juan","lastName":"Perez","email":"juanpets@gmail.com","password":"88754129","phone":"3002225566","userStatus":1}

  Scenario: Actualizar nombre y correo del usuario
    * def username = "Juan0889"
    * def newUser =
   """{
  "id": 1547772,
  "username": "Juan0889",
  "firstName": "Alfonso",
  "lastName": "Perez",
  "email": "juanpets@gmail.com",
  "password": "88754129",
  "phone": "3002222222",
  "userStatus": 1
    }"""
    Given path 'user/' + username
    And request newUser
    When method PUT
    Then status 200
    And match response == {"code":200,"type":"unknown","message":"1547772"}

  Scenario: Buscar usuario actualizado
    * def username = "Juan0889"
    Given path 'user/' + username
    When method GET
    Then status 200
    And match response == {"id":1547772,"username":"Juan0889","firstName":"Alfonso","lastName":"Perez","email":"juanpets@gmail.com","password":"88754129","phone":"3002222222","userStatus":1}

  Scenario: Eliminar usuario
    * def username = "Juan0889"
    Given path 'user/' + username
    When method DELETE
    Then status 200

