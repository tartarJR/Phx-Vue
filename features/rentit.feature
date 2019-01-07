Feature: Rent a plant
    As a customer
    Such that I need a plant to operate
    I want to see available plants with their price and description
    Scenario: Finding a plant
        Given the following plants
            | name      | description              | price_per_day  |
            | Excavator | 1.5 Tonne Mini Excavator | 150.00 |
            | Excavator | 10 Tonne Mini Excavator  | 100.00 |
        And I want to rent "Excavator"
        And I open RentIt' web page
        And I enter the plant name
        And I enter the start_date
        And I enter the end_date
        When I submit the request
        Then I should receive a list of free plants