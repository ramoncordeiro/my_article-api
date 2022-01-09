module Api 
    module V1
        class ArticlesController < ApplicationController
            #A funcao index mostra todos os artigos
            def index
                articles = Article.order('created_at DESC');            
                render json: {status: 'SUCESS', message: 'Articles loaded', data:articles},status: :ok
            end

            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCESS', message:'LOADED ARTICLE', data:article},status: :ok
            end

            def create
                    article = Article.new(article_params)
                    if article.save 
                        render json: {status: 'SUCESS', message:'Article Saved', data:article },status: :ok 

                    else
                        render json: {status: 'ERROR', message:'Article not created', data:article},status: :ok
                    end                   
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {status: 'SUCESS', message: 'Article destroyed', data:article},status: :ok
            end

            


            def update
				article = Article.find(params[:id])
				if article.update_attributes(article_params)
					render json: {status: 'SUCCESS', message:'Updated article', data:article},status: :ok
				else
					render json: {status: 'ERROR', message:'Articles not update', data:article.erros},status: :unprocessable_entity
				end
			end

            private 
            def article_params
                    params.permit(:title, :body)
            end
        end
    end
end

