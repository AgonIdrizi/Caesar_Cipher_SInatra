require 'sinatra'
require 'sinatra/reloader' if development?


def caesar (input_string, n)

alphabet_arr = "abcdefghijklmnopqrstuvwxyz".split("")
num = n

input_arr = input_string.split("")


input_arr.collect.with_index { |item, i|

	
	if  input_arr[i] =~ /[[:upper:]]/ #checks for uppercase characters
		index_of_alphabet =  alphabet_arr.index(input_arr[i].downcase)
		if (index_of_alphabet + n > 26)	
		  input_arr[i] = alphabet_arr[index_of_alphabet + n - 26].upcase
		else
		  input_arr[i] = alphabet_arr[index_of_alphabet + n].upcase
		  puts input_arr[i]
		next
		end
	end

	index_of_alphabet =  alphabet_arr.index(input_arr[i])
	
	if index_of_alphabet == nil #checks for non-word characters
		next
	end

	if (index_of_alphabet + n > 26) #
	  input_arr[i] = alphabet_arr[index_of_alphabet + n - 26 ]
	else
	  input_arr[i] = alphabet_arr[index_of_alphabet + n]
	end	
}

input_arr.join("")
end

get '/' do
	
	erb :index , :locals =>{:string => ""}

end

post '/' do
	text = params['cipher']
	number = params['shift'].to_i
	string = caesar(text,number)

erb :index , :locals => {:string => string}
end