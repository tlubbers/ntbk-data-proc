# Module 2 - Relational Data Modeling

## Data Models

*Model*
An abstraction of a complex real-world object or event

*Data models*
Relatively simple representations, usually graphical, of complex real-world data structures

### Elements of a Data Model

- Entity - anything about which data are to be collected and stored (e.g. person, thing, event, place)
- Attribute - a characteristic of an entity
- Relationship - describes an association among entities
- One-to-many (1:M) relationship
- Many-to-many (M:N or M:M) relationship
- One-to-one (1:1) relationship
- Constraint - a restriction placed on the data to ensure data integrity

How are these elements identified and implemented? *Business Rules*.

### Business Rules
Business rules come from key users, management, written documents, and a number of other sources. These rules are then translated into the elements that make up a data model.

There are many techniques for translating business rules into data modeling entities.

- *Nouns* translate into entities
- *Verbs* translate into relationships among entities
- Relationships are bidirectional
- Two questions help to identify the relationship type:
    - How many instances of B are related to one instance of A?
    - How many instances of A are related to one instance of B?

### The Relational Model

- Developed by Edgar F. Codd (IBM) in 1970
- Conceptually simple
- Considered ingenious but impractical in 1970
    - Computers lacked power to implement the relational model
    - Today, microcomputers can run sophisticated relational DB software
- Implemented through a Relational DBMS
    - Hides complexity from the user
- Relational Table is a purely logical structure
    - How data are physically stored in the DB is of no concern to the user or the designer
    - This property became the source of a real DB revolution
- Rise to dominance due in part to its powerful and flexible Structured Query Language
- Though a vast improvement, it still lacks features as an effective design tool

### The Entity Relationship Model

- Introduced by Peter Chen in 1976
- Widely accepted standard for data modeling
- Graphical representation of entities and their relationships in a database structure
- Entity relationship diagram (ERD)

### Cardinality

*Cardinality*

Expresses min and max number of entity occurrences associated with one occurrence of related entity. The following table overviews the possible combinations of related entities.

<table>
<tbody>
<tr>
<td>left</td>
<td>right</td>
<td></td>
<td>example</td>
</tr>
<tr>
<td><b>1</b></td>
<td><b>1</b></td>
<td>one-to-one</td>
<td>person &lt;-&gt; weight</td>
</tr>
<tr>
<td><b>0..1</b></td>
<td><b>1</b></td>
<td><i>optional on one side</i> one-to-one</td>
<td>date of death &lt;-&gt; person</td>
</tr>
<tr>
<td><b>0..*</b> or <b>*</b></td>
<td><b>0..*</b> or <b>*</b></td>
<td><i>optional on both sides</i> many-to-many</td>
<td>person &lt;-&gt; book</td>
</tr>
<tr>
<td><b>1</b></td>
<td><b>1..*</b></td>
<td>one-to-many</td>
<td>Birth Place &lt;-&gt; person</td>
</tr>
</tbody>
</table>


## Take-aways

- Each new data model improved on the previous ones
- Network Models replaced Hierarchical Models because it better represent M:N relationships
- Relational Models thrived with its data independence, simple data representation, easy-to-use query language
- OO have gained a substantial foothold, but cannot yet dislodge Relational Models
- The cardinalities define the possible number of entities on both sides of the relationship.



