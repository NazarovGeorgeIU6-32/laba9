class CalcController < ApplicationController
	def input
	end

	def ifPalindrom(num)
	  #mas = num.split(/([1-9])/)
	  mas = num.split("")
	  #p mas
	  n = mas.length / 2 
	  #1234321
	  ifpolindrom = true
	  for i in 0..n
		if mas[i] != mas[mas.length - 1 - i]
			ifpolindrom = false
		end
	  end
	  ifpolindrom
	end

	def Change(num)
	  mas = num.split("")
	  n = mas.length / 2 
	  n -= 1
	  for i in 0..n
		  c = mas[i]	
		  mas[i] = mas[mas.length - 1 - i]
		  mas[mas.length - 1 - i] = c
	  end
	  
	  (mas.join.to_i + num.to_i).to_s
	  
	end

	def view
		str = params[:v1].to_s

		resul_array = []
		count = 0
		resul_array[count] = str
		while !ifPalindrom(str)

			str = Change(str)
			count += 1
			resul_array[count] = str
			#p str
		end

		#v1 = params[:v1].to_s
		@result = resul_array
		
		respond_to do |format|
			format.html
			format.json do
				render json:
					{type: @result.class.to_s, value: @result}
			end
		end
	
	end
end