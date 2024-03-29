class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new

	end

	def edit
		@article = Article.find(params[:id]);
	end

	def update
		@articleToUpdate = Article.find(params[:id]);

		if @articleToUpdate.update_attributes(article_params)
		    redirect_to articles_path
	  	else
	    	render 'edit'
	  	end
	end

	def create  		
		@article = Article.new(article_params);
		@article.save
		redirect_to @article
	end

	def show
		@article = Article.find(params[:id]);
	end

	def destroy
		@article = Article.find(params[:id]);
		@article.destroy

		redirect_to articles_path
	end

	private 
		def article_params
			params.require(:article).permit(:title, :text);
		end

end
