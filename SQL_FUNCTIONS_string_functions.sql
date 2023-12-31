USE EMPRESA_DB;

-- SQL SERVER STRING FUNCTIONS

-- CONCAT
PRINT CONCAT('A', ' B', ' C', ' D');

-- LTRIM
PRINT CONCAT('TEST', '   TEST');
PRINT CONCAT('TEST', LTRIM('   TEST'));

-- RTRIM
PRINT CONCAT('TEST     ', 'TEST');
PRINT CONCAT(RTRIM('TEST   '), 'TEST');

-- TRIM
PRINT '     TEST' + ' TEST    ';
PRINT TRIM('     TEST' + ' TEST    ');

-- LEFT
PRINT LEFT('TEST', 3);

-- RIGHT
PRINT RIGHT('TEST', 2);

-- SUBSTRING(string, start, length)
PRINT SUBSTRING('TEST', 1, 3);

-- LENGTH
PRINT LEN('TEST');

-- UPPERCASE
PRINT UPPER('test');

-- LOWERCASE
PRINT LOWER('TEST');

-- REPLICATE(string, x times)
PRINT REPLICATE('Q', 40);

PRINT 000000.44

PRINT CONCAT(REPLICATE('0', 6), .44);

-- REPLACE(string, old_string, new_string)
PRINT REPLACE('TEST', 'T', 'M');

-- REVERSE
PRINT REVERSE('TEST');