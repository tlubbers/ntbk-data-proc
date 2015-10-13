# Mod 5 - ERD Conversion

## Relation:
 - A named, two-dimensional table of data

### Requirements for a table to qualify as a relation:
- It must have a unique name
- Every attribute value must be atomic (not multivalued)
- Every row must be unique (no duplicate rows allowed)
- Attributes (columns) must have unique names
- The order of the columns and rows must be irrelevant

## Foreign Keys vs Primary Keys

- Keys are special fields that serve two main purposes:
    - Primary keys are unique identifiers of the relation in question. Examples include employee numbers, SSN, etc.
    - Foreign keys are identifiers that enable a dependent relation (on the many side of a relationship) to refer to its parent relation (on the one side of the relationship)
- Keys can be simple (a single field) or composite (more than one field)
- Keys usually are used as indexes to speed up the response to user queries

## Relational Schemas
