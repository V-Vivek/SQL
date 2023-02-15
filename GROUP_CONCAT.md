# GROUP_CONCAT()
- It returns a concatenated string.
- It'll concatenate strings from a group into a single string with various options.

## Syntax
```
GROUP_CONCAT
(
  DISTINCT expression
  ORDER BY expression
  SEPARATOR sep
);
```

- The DISTINCT clause allows us to eliminate duplicate values in the group before concatenating them.
- The ORDER BY clause allows us to sort the values in ascending or descending order before concatenating.
- The SEPARATOR specifies a literal value inserted between values in the group.
- The GROUP_CONCAT function uses a comma (,) as the default separator.
- The GROUP_CONCAT function ignores NULL values.
- It returns NULL if there was no matching row found or all arguments are NULL values.

## Note:
- GROUP_CONCAT () function concatenates string values in different rows.
- CONCAT () function concatenates two or more string values in different columns.

## Example:

- We have Customers table with customers name and respective sales representative.
- We have Employees table with sales representative details.
- ***Problem*** - To get the customers associated with each sales representative.

![image](https://user-images.githubusercontent.com/117569148/219081088-6c875db7-3fc5-49fb-b2ed-2b8b3dcce3eb.png)
