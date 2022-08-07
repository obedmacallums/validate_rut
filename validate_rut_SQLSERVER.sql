IF object_id('validar_rut_o') IS NOT NULL
BEGIN
    DROP FUNCTION validar_rut_o
END
GO



CREATE FUNCTION validar_rut_o (
				@rut varchar(20)
				)
RETURNS int

AS
BEGIN
/*
FUNCTION TO VALIDATE RUT WITH MODULE 11
valid rut format: 7 or 8 digits + "-" + a digit or letter k(K)
@rut - rut to validate (varchar 20)

the function returns only 3 integer values:
0 - invalid route format
1 - valid route format, but fails modulo 11 verification
2 - valid rut format and passes verification of module 11
*/

	declare @index int
	declare @dv varchar (20)
	declare @dv_num int
	declare @reversed_rut varchar (20)
	declare @total_sum int
	declare @multiple int
	declare @counter int
	declare @module_11 int
	declare @ok int
	   
		IF @rut LIKE REPLICATE('[0-9]', 8) + '-[0-9K]' or @rut LIKE REPLICATE('[0-9]', 7) + '-[0-9K]'
			BEGIN
			set @index = 1
			set @dv = SUBSTRING (@rut, len(@rut), 1)
			
			if @dv = 'k' or @dv = 'K'
			set @dv_num = 10
			else if @dv = '0'
			set @dv_num = 11
			else
			set @dv_num = cast(@dv as int)

			set @reversed_rut = REVERSE(SUBSTRING(@rut, 1, (len(@rut)-2)))
			set @total_sum = 0
			set @multiple = 1
			set @counter = 1

				while @counter < (len (@reversed_rut)+1)
				begin

				if @multiple < 7
				set @multiple = @multiple + 1
				else
				set @multiple = 2

				set @total_sum = @total_sum + @multiple * cast (SUBSTRING (@reversed_rut, @index, 1) as int)
				set @counter = @counter + 1
				set @index = @index + 1

				end
			set @module_11 = 11- (@total_sum % 11)

			if @module_11 = @dv_num
			set @ok = 2
			else
			set @ok = 1

			END
			ELSE
			set @ok = 0
		
	return @ok

END